
{{- define "go-echo66fc2296-0f5d-4fd5-9e48-c09b7dfee66d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo66fc2296-0f5d-4fd5-9e48-c09b7dfee66d.fullname" -}}
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


{{- define "go-echo66fc2296-0f5d-4fd5-9e48-c09b7dfee66d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo66fc2296-0f5d-4fd5-9e48-c09b7dfee66d.labels" -}}
helm.sh/chart: {{ include "go-echo66fc2296-0f5d-4fd5-9e48-c09b7dfee66d.chart" . }}
{{ include "go-echo66fc2296-0f5d-4fd5-9e48-c09b7dfee66d.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo66fc2296-0f5d-4fd5-9e48-c09b7dfee66d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo66fc2296-0f5d-4fd5-9e48-c09b7dfee66d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}