
{{- define "go-echo042d0a76-42d2-43b9-b4cc-a2df851b97df.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo042d0a76-42d2-43b9-b4cc-a2df851b97df.fullname" -}}
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


{{- define "go-echo042d0a76-42d2-43b9-b4cc-a2df851b97df.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo042d0a76-42d2-43b9-b4cc-a2df851b97df.labels" -}}
helm.sh/chart: {{ include "go-echo042d0a76-42d2-43b9-b4cc-a2df851b97df.chart" . }}
{{ include "go-echo042d0a76-42d2-43b9-b4cc-a2df851b97df.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo042d0a76-42d2-43b9-b4cc-a2df851b97df.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo042d0a76-42d2-43b9-b4cc-a2df851b97df.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}