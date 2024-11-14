
{{- define "go-echo48a4fa84-9dcb-4a48-ae21-6367c4ac7aeb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo48a4fa84-9dcb-4a48-ae21-6367c4ac7aeb.fullname" -}}
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


{{- define "go-echo48a4fa84-9dcb-4a48-ae21-6367c4ac7aeb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo48a4fa84-9dcb-4a48-ae21-6367c4ac7aeb.labels" -}}
helm.sh/chart: {{ include "go-echo48a4fa84-9dcb-4a48-ae21-6367c4ac7aeb.chart" . }}
{{ include "go-echo48a4fa84-9dcb-4a48-ae21-6367c4ac7aeb.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo48a4fa84-9dcb-4a48-ae21-6367c4ac7aeb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo48a4fa84-9dcb-4a48-ae21-6367c4ac7aeb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}