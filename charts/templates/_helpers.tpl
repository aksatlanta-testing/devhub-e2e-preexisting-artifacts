
{{- define "go-echo9c5afa80-4af1-4b3c-b4dc-3e8a301ac4bc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9c5afa80-4af1-4b3c-b4dc-3e8a301ac4bc.fullname" -}}
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


{{- define "go-echo9c5afa80-4af1-4b3c-b4dc-3e8a301ac4bc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9c5afa80-4af1-4b3c-b4dc-3e8a301ac4bc.labels" -}}
helm.sh/chart: {{ include "go-echo9c5afa80-4af1-4b3c-b4dc-3e8a301ac4bc.chart" . }}
{{ include "go-echo9c5afa80-4af1-4b3c-b4dc-3e8a301ac4bc.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9c5afa80-4af1-4b3c-b4dc-3e8a301ac4bc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9c5afa80-4af1-4b3c-b4dc-3e8a301ac4bc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}