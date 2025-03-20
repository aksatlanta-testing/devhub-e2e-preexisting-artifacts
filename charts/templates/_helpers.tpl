
{{- define "go-echo6aa1f1b4-f63b-4b6d-8223-2da244e2d861.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6aa1f1b4-f63b-4b6d-8223-2da244e2d861.fullname" -}}
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


{{- define "go-echo6aa1f1b4-f63b-4b6d-8223-2da244e2d861.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6aa1f1b4-f63b-4b6d-8223-2da244e2d861.labels" -}}
helm.sh/chart: {{ include "go-echo6aa1f1b4-f63b-4b6d-8223-2da244e2d861.chart" . }}
{{ include "go-echo6aa1f1b4-f63b-4b6d-8223-2da244e2d861.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6aa1f1b4-f63b-4b6d-8223-2da244e2d861.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6aa1f1b4-f63b-4b6d-8223-2da244e2d861.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}