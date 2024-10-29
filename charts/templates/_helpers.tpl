
{{- define "go-echo23d1d5c6-bb7d-4a9f-891a-e49ccd177ccc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo23d1d5c6-bb7d-4a9f-891a-e49ccd177ccc.fullname" -}}
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


{{- define "go-echo23d1d5c6-bb7d-4a9f-891a-e49ccd177ccc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo23d1d5c6-bb7d-4a9f-891a-e49ccd177ccc.labels" -}}
helm.sh/chart: {{ include "go-echo23d1d5c6-bb7d-4a9f-891a-e49ccd177ccc.chart" . }}
{{ include "go-echo23d1d5c6-bb7d-4a9f-891a-e49ccd177ccc.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo23d1d5c6-bb7d-4a9f-891a-e49ccd177ccc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo23d1d5c6-bb7d-4a9f-891a-e49ccd177ccc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}