
{{- define "go-echo48747ee9-b85c-4dea-8e46-f2636be3e845.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo48747ee9-b85c-4dea-8e46-f2636be3e845.fullname" -}}
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


{{- define "go-echo48747ee9-b85c-4dea-8e46-f2636be3e845.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo48747ee9-b85c-4dea-8e46-f2636be3e845.labels" -}}
helm.sh/chart: {{ include "go-echo48747ee9-b85c-4dea-8e46-f2636be3e845.chart" . }}
{{ include "go-echo48747ee9-b85c-4dea-8e46-f2636be3e845.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo48747ee9-b85c-4dea-8e46-f2636be3e845.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo48747ee9-b85c-4dea-8e46-f2636be3e845.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}