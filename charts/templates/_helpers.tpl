
{{- define "go-echoaf03be82-8c10-4f13-912d-4e6f2795530c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaf03be82-8c10-4f13-912d-4e6f2795530c.fullname" -}}
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


{{- define "go-echoaf03be82-8c10-4f13-912d-4e6f2795530c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaf03be82-8c10-4f13-912d-4e6f2795530c.labels" -}}
helm.sh/chart: {{ include "go-echoaf03be82-8c10-4f13-912d-4e6f2795530c.chart" . }}
{{ include "go-echoaf03be82-8c10-4f13-912d-4e6f2795530c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaf03be82-8c10-4f13-912d-4e6f2795530c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaf03be82-8c10-4f13-912d-4e6f2795530c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}