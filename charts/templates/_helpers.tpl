
{{- define "go-echo0dfa189f-cdb9-4d33-bd38-b1312c9cc58a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0dfa189f-cdb9-4d33-bd38-b1312c9cc58a.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echo0dfa189f-cdb9-4d33-bd38-b1312c9cc58a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo0dfa189f-cdb9-4d33-bd38-b1312c9cc58a.labels" -}}
helm.sh/chart: {{ include "go-echo0dfa189f-cdb9-4d33-bd38-b1312c9cc58a.chart" . }}
{{ include "go-echo0dfa189f-cdb9-4d33-bd38-b1312c9cc58a.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo0dfa189f-cdb9-4d33-bd38-b1312c9cc58a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo0dfa189f-cdb9-4d33-bd38-b1312c9cc58a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}