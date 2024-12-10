
{{- define "go-echocb31ce82-6ac6-48c2-8fd6-74479596b26f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocb31ce82-6ac6-48c2-8fd6-74479596b26f.fullname" -}}
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


{{- define "go-echocb31ce82-6ac6-48c2-8fd6-74479596b26f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocb31ce82-6ac6-48c2-8fd6-74479596b26f.labels" -}}
helm.sh/chart: {{ include "go-echocb31ce82-6ac6-48c2-8fd6-74479596b26f.chart" . }}
{{ include "go-echocb31ce82-6ac6-48c2-8fd6-74479596b26f.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocb31ce82-6ac6-48c2-8fd6-74479596b26f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocb31ce82-6ac6-48c2-8fd6-74479596b26f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}