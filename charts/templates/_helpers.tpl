
{{- define "go-echoe618f16f-ace1-4b2e-a9b6-95a0cdb754a9.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe618f16f-ace1-4b2e-a9b6-95a0cdb754a9.fullname" -}}
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


{{- define "go-echoe618f16f-ace1-4b2e-a9b6-95a0cdb754a9.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe618f16f-ace1-4b2e-a9b6-95a0cdb754a9.labels" -}}
helm.sh/chart: {{ include "go-echoe618f16f-ace1-4b2e-a9b6-95a0cdb754a9.chart" . }}
{{ include "go-echoe618f16f-ace1-4b2e-a9b6-95a0cdb754a9.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe618f16f-ace1-4b2e-a9b6-95a0cdb754a9.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe618f16f-ace1-4b2e-a9b6-95a0cdb754a9.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}