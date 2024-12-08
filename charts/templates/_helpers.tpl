
{{- define "go-echoa4d873da-f3ac-4fd8-b5d4-c662f9a5a052.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa4d873da-f3ac-4fd8-b5d4-c662f9a5a052.fullname" -}}
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


{{- define "go-echoa4d873da-f3ac-4fd8-b5d4-c662f9a5a052.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa4d873da-f3ac-4fd8-b5d4-c662f9a5a052.labels" -}}
helm.sh/chart: {{ include "go-echoa4d873da-f3ac-4fd8-b5d4-c662f9a5a052.chart" . }}
{{ include "go-echoa4d873da-f3ac-4fd8-b5d4-c662f9a5a052.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa4d873da-f3ac-4fd8-b5d4-c662f9a5a052.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa4d873da-f3ac-4fd8-b5d4-c662f9a5a052.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}